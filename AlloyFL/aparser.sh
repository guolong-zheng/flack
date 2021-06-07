#!/usr/bin/env bash

trap "exit" INT

_APARSER_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. ${_APARSER_DIR}/projects.sh

# Main functionality

function aparser.build() {
        mvn clean package
}

# Copy real faulty models.
function aparser.prepare_real_faults() {
        eval $(obj.unpack "${1}"); shift
        local gen_dir="${GEN_DIR}/real/${obj[model_name]}"
        local result_dir="${RESULT_DIR}/real/${obj[model_name]}"
        rm_and_mkdir "${gen_dir}"
        rm_and_mkdir "${result_dir}"
        echo "Preparing Real Faulty Model ${obj[model_name]}"
        cp "${obj[model_path]}" "${gen_dir}"
}

function aparser.prepare_real_faults.all() {
        echo "Preparing real faults for all models."
        model.foreach aparser.prepare_real_faults REAL_FAULTS[@]
        # Serialize real faults to disk.
        java -cp "${JAR_PATHS}" alloyfl.evaluation.RealFaultMarker
}

### Coverage FL.
function aparser.run_coveragefl.single() {
        java -Djava.library.path="${_APARSER_DIR}/sat-solvers" -cp "${JAR_PATHS}" alloyfl.coverage.CoverageBasedFaultLocator "$@"
}

function aparser.run_coveragefl.multiple() {
        eval $(obj.unpack "${1}"); shift
        local test_dir_path="${1}"; shift
        local test_size="${test_dir_path##*/}"
        local formula="${1}"; shift
        local buggy_model_dir="${GEN_DIR}/real/${obj[model_name]}"
        local result_dir="${RESULT_DIR}/${COVERAGE_FL}/real/${obj[model_name]}/${formula}/${test_size}"
        rm_and_mkdir "${result_dir}"
        local meta_dir="${META_DIR}/${COVERAGE_FL}/real/${obj[model_name]}/${formula}/${test_size}"
        rm_and_mkdir "${meta_dir}"
        echo "Running CoverageFL for buggy models under ${buggy_model_dir} with ${test_size}% tests for ${formula} formula."
        buggy_model_name="${obj[model_name]}"
        echo "Running CoverageFL for ${buggy_model_name}."
        { time aparser.run_coveragefl.single "${buggy_model_dir}/${buggy_model_name}.als" "${test_dir_path}/${obj[test_name]}.als" "${formula}" "${result_dir}" ; } &> "${meta_dir}/${buggy_model_name}.txt"
}

function aparser.run_coveragefl.all() {
        echo "Running CoverageFL for all models."
        REMOVE_FLAG=true
        model.foreach aparser.run_coveragefl.multiple REAL_FAULTS[@] "$@"
        REMOVE_FLAG=false
}

### Unsatbased FL.
function aparser.run_unsatfl.single() {
        java -Djava.library.path="${_APARSER_DIR}/sat-solvers" -cp "${JAR_PATHS}" alloyfl.coverage.UnsatBasedFaultLocator "$@"
}

function aparser.run_unsatfl.multiple() {
        eval $(obj.unpack "${1}"); shift
        local test_dir_path="${1}"; shift
        local test_size="${test_dir_path##*/}"
        local buggy_model_dir="${GEN_DIR}/real/${obj[model_name]}"
        local result_dir="${RESULT_DIR}/${UNSAT_FL}/real/${obj[model_name]}/${test_size}"
        rm_and_mkdir "${result_dir}"
        local meta_dir="${META_DIR}/${UNSAT_FL}/real/${obj[model_name]}/${test_size}"
        rm_and_mkdir "${meta_dir}"
        buggy_model_name="${obj[model_name]}"
        echo "Running UnsatFL for ${buggy_model_name}."
        { time aparser.run_unsatfl.single "${buggy_model_dir}/${buggy_model_name}.als" "${test_dir_path}/${obj[test_name]}.als" "${result_dir}" ; } &> "${meta_dir}/${buggy_model_name}.txt"
}

function aparser.run_unsatfl.all() {
        echo "Running UnsatFL for all models."
        REMOVE_FLAG=true
        model.foreach aparser.run_unsatfl.multiple REAL_FAULTS[@] "$@"
        REMOVE_FLAG=false
}

### Mutation FL.
function aparser.run_mutationfl.single() {
        java -Djava.library.path="${_APARSER_DIR}/sat-solvers" -cp "${JAR_PATHS}" alloyfl.mutation.MutationFaultLocator "$@"
}

function aparser.run_mutationfl.multiple() {
        eval $(obj.unpack "${1}"); shift
        local test_dir_path="${1}"; shift
        local test_size="${test_dir_path##*/}"
        local formula="${1}"; shift
        local buggy_model_dir="${GEN_DIR}/real/${obj[model_name]}"
        local result_dir="${RESULT_DIR}/${MUTATION_FL}/real/${obj[model_name]}/${formula}/${test_size}"
        rm_and_mkdir "${result_dir}"
        local meta_dir="${META_DIR}/${MUTATION_FL}/real/${obj[model_name]}/${formula}/${test_size}"
        rm_and_mkdir "${meta_dir}"
        echo "Running MutationFL for buggy models under ${buggy_model_dir} with ${test_size}% tests for ${formula} formula."
        buggy_model_name="${obj[model_name]}"
        echo "Running MutationFL for ${buggy_model_name}."
        { time aparser.run_mutationfl.single "${buggy_model_dir}/${buggy_model_name}.als" "${test_dir_path}/${obj[test_name]}.als" "${buggy_model_dir}/ORIGINX.als" "${obj[scope]}" "${formula}" "${result_dir}" ; } &> "${meta_dir}/${buggy_model_name}.txt"
}

function aparser.run_mutationfl.all() {
        echo "Running MutationFL for all models."
        REMOVE_FLAG=true
        model.foreach aparser.run_mutationfl.multiple REAL_FAULTS[@] "$@"
        REMOVE_FLAG=false
}

### Hybrid FL using average score of SBFL and MBFL.
function aparser.run_hybridfl_average.single() {
        java -Djava.library.path="${_APARSER_DIR}/sat-solvers" -cp "${JAR_PATHS}" alloyfl.hybrid.HybridAverageFaultLocator "$@"
}

function aparser.run_hybridfl_average.multiple() {
        eval $(obj.unpack "${1}"); shift
        local test_dir_path="${1}"; shift
        # We only use mutation-based test suite
        local test_size="${test_dir_path##*mutation-based/}"
        local test_size=$(echo ${test_size/\//_})
        local formula="${1}"; shift
        local mutationfl_proportion="${1}"; shift
        local buggy_model_dir="${GEN_DIR}/real/${obj[model_name]}"
        local result_dir="${RESULT_DIR}/${HYBRID_FL}/real/${obj[model_name]}/${formula}/${AVERAGE}/${test_size}/${mutationfl_proportion}"
        rm_and_mkdir "${result_dir}"
        local meta_dir="${META_DIR}/${HYBRID_FL}/real/${obj[model_name]}/${formula}/${AVERAGE}/${test_size}/${mutationfl_proportion}"
        rm_and_mkdir "${meta_dir}"
        echo "Running Hybridf Average for buggy models under ${buggy_model_dir} with ${test_size}% tests for ${formula} formula and mutationfl proportion ${mutationfl_proportion}."
        buggy_model_name="${obj[model_name]}"
        echo "Running Hybridfl Average for ${buggy_model_name}."
        { time aparser.run_hybridfl_average.single "${buggy_model_dir}/${buggy_model_name}.als" "${test_dir_path}/${obj[test_name]}.als" "${obj[scope]}" "${formula}" "${result_dir}" "${mutationfl_proportion}" ; } &> "${meta_dir}/${buggy_model_name}.txt"
}

function aparser.run_hybridfl_average.all() {
        echo "Running Hybridfl_Average for all models."
        REMOVE_FLAG=true
        model.foreach aparser.run_hybridfl_average.multiple REAL_FAULTS[@] "$@"
        REMOVE_FLAG=false
}

### Compute effectiveness.

function aparser.compute_effectiveness.single() {
        local fault_file="${1}"; shift
        local fault_list_file="${1}"; shift
        java -cp "${JAR_PATHS}" alloyfl.metrics.EffectivenessReporter "${fault_file}" "${fault_list_file}"
}

function aparser.compute_effectiveness.multiple() {
        eval $(obj.unpack "${1}"); shift
        local technique="${1}"; shift
        local fl_suffix="${1}"; shift
        local fl_result_dir="${RESULT_DIR}/${technique}/real/${obj[model_name]}/${fl_suffix}"
        local fl_meta_dir="${META_DIR}/${technique}/real/${obj[model_name]}/${fl_suffix}"
        rm -f "${fl_meta_dir}/eff.info"
        echo "Running Effectiveness Reporter for ${technique} with model ${obj[model_name]} and save result to ${fl_meta_dir}/eff.info"
        buggy_model_name="${obj[model_name]}"
        ranked_list_file="${fl_result_dir}/${buggy_model_name}.lst"
        if [ ! -f ${ranked_list_file} ]; then
                echo "${ranked_list_file} does not exist!"
                continue
        fi
        echo "Running Effectiveness Reporter for Buggy Model: ${buggy_model_name}"
        # FL.
        echo "Buggy Model: ${buggy_model_name}" >> "${fl_meta_dir}/eff.info"
        aparser.compute_effectiveness.single "${RESULT_DIR}/real/${obj[model_name]}/${buggy_model_name}.flt" "${ranked_list_file}" &>> "${fl_meta_dir}/eff.info"
}

function aparser.compute_coveragefl_effectiveness.all() {
        echo "Running Effectiveness Reporter for ${COVERAGE_FL} with All Buggy Models"
        local test_size="${1}"; shift
        local formula="${1}"; shift
        model.foreach aparser.compute_effectiveness.multiple REAL_FAULTS[@] "${COVERAGE_FL}" "${formula}/${test_size}"
}

function aparser.compute_unsatfl_effectiveness.all() {
        echo "Running Effectiveness Reporter for ${UNSAT_FL} with All Buggy Models"
        local test_size="${1}"; shift
        model.foreach aparser.compute_effectiveness.multiple REAL_FAULTS[@] "${UNSAT_FL}" "${test_size}"
}

function aparser.compute_mutationfl_effectiveness.all() {
        echo "Running Effectiveness Reporter for ${MUTATION_FL} with All Buggy Models"
        local test_size="${1}"; shift
        local formula="${1}"; shift
        model.foreach aparser.compute_effectiveness.multiple REAL_FAULTS[@] "${MUTATION_FL}" "${formula}/${test_size}"
}

function aparser.compute_hybridfl_average_effectiveness.all() {
        echo "Running Effectiveness Reporter for ${HYBRID_FL} Average with All Buggy Models"
        local test_size="${1}"; shift
        local formula="${1}"; shift
        local mutationfl_proportion="${1}"; shift
        model.foreach aparser.compute_effectiveness.multiple REAL_FAULTS[@] "${HYBRID_FL}" "${formula}/${AVERAGE}/${test_size}/${mutationfl_proportion}"
}

# Evaluation purpose only

function model.foreach() {
        local fun="${1}"; shift
        declare -a array=("${!1}"); shift
        for model in ${array[@]}; do
	        ${fun} "$(declare -p ${model})" "$@"
        done
}

function obj.unpack() {
        local aa="${1}"; shift
        echo "declare -A obj="${aa#*=}
}

function rm_and_mkdir() {
        local dir_path="${1}";
        if [ $REMOVE_FLAG = true ]; then
                rm -rf ${dir_path} > /dev/null
                mkdir -p ${dir_path}
        fi
}

# ----------
# Main.

case $1 in
        # Build project.
        --build) shift;
                aparser.build "$@";;
        # Prepare experiments
        --prepare-all) shift;
                aparser.prepare_real_faults.all "$@";;
        ### Run AlloyFL
        # AlloyFLCo.
        # E.g. ./aparser.sh --coveragefl-all experiments/test-suite/mutation-based/100 ochiai
        --coveragefl-all) shift;
                aparser.run_coveragefl.all "$@";;
        # AlloyFLUn.
        # E.g. ./aparser.sh --unsatfl-all experiments/test-suite/mutation-based/100 ochiai
        --unsatfl-all) shift;
                aparser.run_unsatfl.all "$@";;
        # AlloyFLMu.
        # E.g. ./aparser.sh --mutationfl-all experiments/test-suite/mutation-based/100 ochiai
        --mutationfl-all) shift;
                aparser.run_mutationfl.all "$@";;
        # AlloyFLHy.
        # E.g. ./aparser.sh --hybridfl-average-all experiments/test-suite/mutation-based/100 ochiai 0.4
        --hybridfl-average-all) shift;
                aparser.run_hybridfl_average.all "$@";;
        ### Report AlloyFL results
        # Report coveragefl.
        # E.g. ./aparser.sh --report-coveragefl-all 100 ochiai
        --report-coveragefl-all) shift;
	        aparser.compute_coveragefl_effectiveness.all "$@";;
        # Report unsatfl.
        # E.g. ./aparser.sh --report-unsatfl-all 100 ochiai
        --report-unsatfl-all) shift;
	        aparser.compute_unsatfl_effectiveness.all "$@";;
        # Report mutationfl.
        # E.g. ./aparser.sh --report-mutationfl-all 100 ochiai
        --report-mutationfl-all) shift;
	        aparser.compute_mutationfl_effectiveness.all "$@";;
        # Report hybridfl average.
        # E.g. ./aparser.sh --report-hybridfl-average-all 100 ochiai 0.4
        --report-hybridfl-average-all) shift;
	        aparser.compute_hybridfl_average_effectiveness.all "$@";;
        *)
	        echo "ERROR: Incorrect arguments: $@"
	        exit 1;;
esac

cd $_APARSER_DIR
