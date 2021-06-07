#!/usr/bin/env bash

_PROJECT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

EXPERIMENT_DIR="${_PROJECT_DIR}/experiments"
MODEL_DIR="${EXPERIMENT_DIR}/models"
REAL_BUG_DIR="${EXPERIMENT_DIR}/realbugs"
GEN_DIR="${EXPERIMENT_DIR}/gen"
RESULT_DIR="${EXPERIMENT_DIR}/results"
TEST_DIR="${EXPERIMENT_DIR}/test-suite"
META_DIR="${EXPERIMENT_DIR}/meta"

JAR_PATHS="${_PROJECT_DIR}/target/aparser-1.0.jar:${_PROJECT_DIR}/lib/alloy.jar:${_PROJECT_DIR}/lib/guava-27.1-jre.jar"

# Constant
COVERAGE_FL="coveragefl"
UNSAT_FL="unsatfl"
MUTATION_FL="mutationfl"
HYBRID_FL="hybridfl"

AVERAGE="average"

MODELS=(
        "addr"
        "arr"
        "balancedBST"
        "bempl"
        "binaryTree"
        "cd"
        "ctree"
        "dll"
        "farmer"
        "fsm"
        "fullTree"
        "grade"
        "handshake"
        "nqueens"
        "other"
        "sll"
        "student"
)

# Correct Models
declare -g -A addr=(
        [model_name]="addr"
        [model_path]="${MODEL_DIR}/addr.als"
        [correct_model_path]="${MODEL_DIR}/addr.als"
        [scope]="3"
        [test_name]="addr"
)

declare -g -A arr=(
        [model_name]="arr"
        [model_path]="${MODEL_DIR}/arr.als"
        [correct_model_path]="${MODEL_DIR}/arr.als"
        [scope]="3"
        [test_name]="arr"
)

declare -g -A balancedBST=(
        [model_name]="balancedBST"
        [model_path]="${MODEL_DIR}/balancedBST.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A bempl=(
        [model_name]="bempl"
        [model_path]="${MODEL_DIR}/bempl.als"
        [correct_model_path]="${MODEL_DIR}/bempl.als"
        [scope]="3"
        [test_name]="bempl"
)

declare -g -A binaryTree=(
        [model_name]="binaryTree"
        [model_path]="${MODEL_DIR}/binaryTree.als"
        [correct_model_path]="${MODEL_DIR}/binaryTree.als"
        [scope]="3"
        [test_name]="binaryTree"
)

declare -g -A cd=(
        [model_name]="cd"
        [model_path]="${MODEL_DIR}/cd.als"
        [correct_model_path]="${MODEL_DIR}/cd.als"
        [scope]="3"
        [test_name]="cd"
)

declare -g -A ctree=(
        [model_name]="ctree"
        [model_path]="${MODEL_DIR}/ctree.als"
        [correct_model_path]="${MODEL_DIR}/ctree.als"
        [scope]="3"
        [test_name]="ctree"
)

declare -g -A dll=(
        [model_name]="dll"
        [model_path]="${MODEL_DIR}/dll.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A farmer=(
        [model_name]="farmer"
        [model_path]="${MODEL_DIR}/farmer.als"
        [correct_model_path]="${MODEL_DIR}/farmer.als"
        [scope]="4"
        [test_name]="farmer"
)

declare -g -A fsm=(
        [model_name]="fsm"
        [model_path]="${MODEL_DIR}/fsm.als"
        [correct_model_path]="${MODEL_DIR}/fsm.als"
        [scope]="3"
        [test_name]="fsm"
)

declare -g -A fullTree=(
        [model_name]="fullTree"
        [model_path]="${MODEL_DIR}/fullTree.als"
        [correct_model_path]="${MODEL_DIR}/fullTree.als"
        [scope]="3"
        [test_name]="fullTree"
)

declare -g -A grade=(
        [model_name]="grade"
        [model_path]="${MODEL_DIR}/grade.als"
        [correct_model_path]="${MODEL_DIR}/grade.als"
        [scope]="3"
        [test_name]="grade"
)

declare -g -A handshake=(
        [model_name]="handshake"
        [model_path]="${MODEL_DIR}/handshake.als"
        [correct_model_path]="${MODEL_DIR}/handshake.als"
        [scope]="4"
        [test_name]="handshake"
)

declare -g -A nqueens=(
        [model_name]="nqueens"
        [model_path]="${MODEL_DIR}/nqueens.als"
        [correct_model_path]="${MODEL_DIR}/nqueens.als"
        [scope]="4"
        [test_name]="nqueens"
)

declare -g -A other=(
        [model_name]="other"
        [model_path]="${MODEL_DIR}/other.als"
        [correct_model_path]="${MODEL_DIR}/other.als"
        [scope]="3"
        [test_name]="other"
)

declare -g -A sll=(
        [model_name]="sll"
        [model_path]="${MODEL_DIR}/sll.als"
        [correct_model_path]="${MODEL_DIR}/sll.als"
        [scope]="3"
        [test_name]="sll"
)

declare -g -A student=(
        [model_name]="student"
        [model_path]="${MODEL_DIR}/student.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

# Real World Faulty Alloy Models

REAL_FAULTS=(
        "addrFaulty"
        "arr1"
        "arr2"
        # new arr real bugs
        "arr3"
        "arr4"
        "arr5"
        "arr6"
        "arr7"
        "arr8"
        "arr9"
        "arr10"
        "arr11"
        "balancedBST1"
        "balancedBST2"
        "balancedBST3"
        # new balancedBST real bugs
        "balancedBST4"
        "balancedBST5"
        "balancedBST6"
        "balancedBST7"
        "balancedBST8"
        "balancedBST9"
        "balancedBST10"
        "balancedBST11"
        "balancedBST12"
        "balancedBST13"
        "balancedBST14"
        "balancedBST15"
        "balancedBST16"
        "balancedBST17"
        "balancedBST18"
        "balancedBST19"
        "balancedBST20"
        "balancedBST21"
        "balancedBST22"
        "bemplFaulty"
        "cd1"
        "cd2"
        "cd3"
        "ctreeFaulty"
        "dll1"
        "dll2"
        "dll3"
        "dll4"
        # new dll real bugs
        "dll5"
        "dll6"
        "dll7"
        "dll8"
        "dll9"
        "dll10"
        "dll11"
        "dll12"
        "dll13"
        "dll14"
        "dll15"
        "dll16"
        "dll17"
        "dll18"
        "dll19"
        "dll20"
        "farmerFaulty"
        "fsm1"
        "fsm2"
        # new fsm real bugs
        "fsm3"
        "fsm4"
        "fsm5"
        "fsm6"
        "fsm7"
        "fsm8"
        "fsm9"
        "gradeFaulty"
        "otherFaulty"
        "student1"
        "student2"
        "student3"
        "student4"
        "student5"
        "student6"
        "student7"
        "student8"
        "student9"
        "student10"
        "student11"
        "student12"
        "student13"
        "student14"
        "student15"
        "student16"
        "student17"
        "student18"
        "student19"
)

declare -g -A addrFaulty=(
        [model_name]="addrFaulty"
        [model_path]="${REAL_BUG_DIR}/addrFaulty.als"
        [correct_model_path]="${MODEL_DIR}/addr.als"
        [scope]="3"
        [test_name]="addr"
)

declare -g -A arr1=(
        [model_name]="arr1"
        [model_path]="${REAL_BUG_DIR}/arr1.als"
        [correct_model_path]="${MODEL_DIR}/addr.als"
        [scope]="3"
        [test_name]="arr"
)

declare -g -A arr2=(
        [model_name]="arr2"
        [model_path]="${REAL_BUG_DIR}/arr2.als"
        [correct_model_path]="${MODEL_DIR}/addr.als"
        [scope]="3"
        [test_name]="arr"
)

declare -g -A arr3=(
        [model_name]="arr3"
        [model_path]="${REAL_BUG_DIR}/arr3.als"
        [correct_model_path]="${MODEL_DIR}/addr.als"
        [scope]="3"
        [test_name]="arr"
)

declare -g -A arr4=(
        [model_name]="arr4"
        [model_path]="${REAL_BUG_DIR}/arr4.als"
        [correct_model_path]="${MODEL_DIR}/addr.als"
        [scope]="3"
        [test_name]="arr"
)

declare -g -A arr5=(
        [model_name]="arr5"
        [model_path]="${REAL_BUG_DIR}/arr5.als"
        [correct_model_path]="${MODEL_DIR}/addr.als"
        [scope]="3"
        [test_name]="arr"
)

declare -g -A arr6=(
        [model_name]="arr6"
        [model_path]="${REAL_BUG_DIR}/arr6.als"
        [correct_model_path]="${MODEL_DIR}/addr.als"
        [scope]="3"
        [test_name]="arr"
)

declare -g -A arr7=(
        [model_name]="arr7"
        [model_path]="${REAL_BUG_DIR}/arr7.als"
        [correct_model_path]="${MODEL_DIR}/addr.als"
        [scope]="3"
        [test_name]="arr"
)

declare -g -A arr8=(
        [model_name]="arr8"
        [model_path]="${REAL_BUG_DIR}/arr8.als"
        [correct_model_path]="${MODEL_DIR}/addr.als"
        [scope]="3"
        [test_name]="arr"
)

declare -g -A arr9=(
        [model_name]="arr9"
        [model_path]="${REAL_BUG_DIR}/arr9.als"
        [correct_model_path]="${MODEL_DIR}/addr.als"
        [scope]="3"
        [test_name]="arr"
)

declare -g -A arr10=(
        [model_name]="arr10"
        [model_path]="${REAL_BUG_DIR}/arr10.als"
        [correct_model_path]="${MODEL_DIR}/addr.als"
        [scope]="3"
        [test_name]="arr"
)

declare -g -A arr11=(
        [model_name]="arr11"
        [model_path]="${REAL_BUG_DIR}/arr11.als"
        [correct_model_path]="${MODEL_DIR}/addr.als"
        [scope]="3"
        [test_name]="arr"
)

declare -g -A balancedBST1=(
        [model_name]="balancedBST1"
        [model_path]="${REAL_BUG_DIR}/balancedBST1.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST2=(
        [model_name]="balancedBST2"
        [model_path]="${REAL_BUG_DIR}/balancedBST2.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST3=(
        [model_name]="balancedBST3"
        [model_path]="${REAL_BUG_DIR}/balancedBST3.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST4=(
        [model_name]="balancedBST4"
        [model_path]="${REAL_BUG_DIR}/balancedBST4.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST5=(
        [model_name]="balancedBST5"
        [model_path]="${REAL_BUG_DIR}/balancedBST5.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST6=(
        [model_name]="balancedBST6"
        [model_path]="${REAL_BUG_DIR}/balancedBST6.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST7=(
        [model_name]="balancedBST7"
        [model_path]="${REAL_BUG_DIR}/balancedBST7.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST8=(
        [model_name]="balancedBST8"
        [model_path]="${REAL_BUG_DIR}/balancedBST8.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST9=(
        [model_name]="balancedBST9"
        [model_path]="${REAL_BUG_DIR}/balancedBST9.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST10=(
        [model_name]="balancedBST10"
        [model_path]="${REAL_BUG_DIR}/balancedBST10.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST11=(
        [model_name]="balancedBST11"
        [model_path]="${REAL_BUG_DIR}/balancedBST11.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST12=(
        [model_name]="balancedBST12"
        [model_path]="${REAL_BUG_DIR}/balancedBST12.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST13=(
        [model_name]="balancedBST13"
        [model_path]="${REAL_BUG_DIR}/balancedBST13.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST14=(
        [model_name]="balancedBST14"
        [model_path]="${REAL_BUG_DIR}/balancedBST14.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST15=(
        [model_name]="balancedBST15"
        [model_path]="${REAL_BUG_DIR}/balancedBST15.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST16=(
        [model_name]="balancedBST16"
        [model_path]="${REAL_BUG_DIR}/balancedBST16.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST17=(
        [model_name]="balancedBST17"
        [model_path]="${REAL_BUG_DIR}/balancedBST17.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST18=(
        [model_name]="balancedBST18"
        [model_path]="${REAL_BUG_DIR}/balancedBST18.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST19=(
        [model_name]="balancedBST19"
        [model_path]="${REAL_BUG_DIR}/balancedBST19.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST20=(
        [model_name]="balancedBST20"
        [model_path]="${REAL_BUG_DIR}/balancedBST20.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST21=(
        [model_name]="balancedBST21"
        [model_path]="${REAL_BUG_DIR}/balancedBST21.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A balancedBST22=(
        [model_name]="balancedBST22"
        [model_path]="${REAL_BUG_DIR}/balancedBST22.als"
        [correct_model_path]="${MODEL_DIR}/balancedBST.als"
        [scope]="4"
        [test_name]="balancedBST"
)

declare -g -A bemplFaulty=(
        [model_name]="bemplFaulty"
        [model_path]="${REAL_BUG_DIR}/bemplFaulty.als"
        [correct_model_path]="${MODEL_DIR}/bempl.als"
        [scope]="3"
        [test_name]="bempl"
)

declare -g -A cd1=(
        [model_name]="cd1"
        [model_path]="${REAL_BUG_DIR}/cd1.als"
        [correct_model_path]="${MODEL_DIR}/cd.als"
        [scope]="3"
        [test_name]="cd"
)

declare -g -A cd2=(
        [model_name]="cd2"
        [model_path]="${REAL_BUG_DIR}/cd2.als"
        [correct_model_path]="${MODEL_DIR}/cd.als"
        [scope]="3"
        [test_name]="cd"
)

declare -g -A cd3=(
        [model_name]="cd3"
        [model_path]="${REAL_BUG_DIR}/cd3.als"
        [correct_model_path]="${MODEL_DIR}/cd.als"
        [scope]="3"
        [test_name]="cd"
)

declare -g -A ctreeFaulty=(
        [model_name]="ctreeFaulty"
        [model_path]="${REAL_BUG_DIR}/ctreeFaulty.als"
        [correct_model_path]="${MODEL_DIR}/ctree.als"
        [scope]="3"
        [test_name]="ctree"
)

declare -g -A dijkstraFaulty=(
        [model_name]="dijkstraFaulty"
        [model_path]="${REAL_BUG_DIR}/dijkstraFaulty.als"
        [correct_model_path]="${MODEL_DIR}/dijkstra.als"
        [scope]="3"
        [test_name]="dijkstra"
)

declare -g -A dll1=(
        [model_name]="dll1"
        [model_path]="${REAL_BUG_DIR}/dll1.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll2=(
        [model_name]="dll2"
        [model_path]="${REAL_BUG_DIR}/dll2.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll3=(
        [model_name]="dll3"
        [model_path]="${REAL_BUG_DIR}/dll3.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll4=(
        [model_name]="dll4"
        [model_path]="${REAL_BUG_DIR}/dll4.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll5=(
        [model_name]="dll5"
        [model_path]="${REAL_BUG_DIR}/dll5.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll6=(
        [model_name]="dll6"
        [model_path]="${REAL_BUG_DIR}/dll6.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll7=(
        [model_name]="dll7"
        [model_path]="${REAL_BUG_DIR}/dll7.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll8=(
        [model_name]="dll8"
        [model_path]="${REAL_BUG_DIR}/dll8.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll9=(
        [model_name]="dll9"
        [model_path]="${REAL_BUG_DIR}/dll9.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll10=(
        [model_name]="dll10"
        [model_path]="${REAL_BUG_DIR}/dll10.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll11=(
        [model_name]="dll11"
        [model_path]="${REAL_BUG_DIR}/dll11.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll12=(
        [model_name]="dll12"
        [model_path]="${REAL_BUG_DIR}/dll12.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll13=(
        [model_name]="dll13"
        [model_path]="${REAL_BUG_DIR}/dll13.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll14=(
        [model_name]="dll14"
        [model_path]="${REAL_BUG_DIR}/dll14.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll15=(
        [model_name]="dll15"
        [model_path]="${REAL_BUG_DIR}/dll15.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll16=(
        [model_name]="dll16"
        [model_path]="${REAL_BUG_DIR}/dll16.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll17=(
        [model_name]="dll17"
        [model_path]="${REAL_BUG_DIR}/dll17.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll18=(
        [model_name]="dll18"
        [model_path]="${REAL_BUG_DIR}/dll18.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll19=(
        [model_name]="dll19"
        [model_path]="${REAL_BUG_DIR}/dll19.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A dll20=(
        [model_name]="dll20"
        [model_path]="${REAL_BUG_DIR}/dll20.als"
        [correct_model_path]="${MODEL_DIR}/dll.als"
        [scope]="3"
        [test_name]="dll"
)

declare -g -A farmerFaulty=(
        [model_name]="farmerFaulty"
        [model_path]="${REAL_BUG_DIR}/farmerFaulty.als"
        [correct_model_path]="${MODEL_DIR}/farmer.als"
        [scope]="4"
        [test_name]="farmer"
)

declare -g -A fsm1=(
        [model_name]="fsm1"
        [model_path]="${REAL_BUG_DIR}/fsm1.als"
        [correct_model_path]="${MODEL_DIR}/fsm.als"
        [scope]="3"
        [test_name]="fsm"
)

declare -g -A fsm2=(
        [model_name]="fsm2"
        [model_path]="${REAL_BUG_DIR}/fsm2.als"
        [correct_model_path]="${MODEL_DIR}/fsm.als"
        [scope]="3"
        [test_name]="fsm"
)

declare -g -A fsm3=(
        [model_name]="fsm3"
        [model_path]="${REAL_BUG_DIR}/fsm3.als"
        [correct_model_path]="${MODEL_DIR}/fsm.als"
        [scope]="3"
        [test_name]="fsm"
)

declare -g -A fsm4=(
        [model_name]="fsm4"
        [model_path]="${REAL_BUG_DIR}/fsm4.als"
        [correct_model_path]="${MODEL_DIR}/fsm.als"
        [scope]="3"
        [test_name]="fsm"
)

declare -g -A fsm5=(
        [model_name]="fsm5"
        [model_path]="${REAL_BUG_DIR}/fsm5.als"
        [correct_model_path]="${MODEL_DIR}/fsm.als"
        [scope]="3"
        [test_name]="fsm"
)

declare -g -A fsm6=(
        [model_name]="fsm6"
        [model_path]="${REAL_BUG_DIR}/fsm6.als"
        [correct_model_path]="${MODEL_DIR}/fsm.als"
        [scope]="3"
        [test_name]="fsm"
)

declare -g -A fsm7=(
        [model_name]="fsm7"
        [model_path]="${REAL_BUG_DIR}/fsm7.als"
        [correct_model_path]="${MODEL_DIR}/fsm.als"
        [scope]="3"
        [test_name]="fsm"
)

declare -g -A fsm8=(
        [model_name]="fsm8"
        [model_path]="${REAL_BUG_DIR}/fsm8.als"
        [correct_model_path]="${MODEL_DIR}/fsm.als"
        [scope]="3"
        [test_name]="fsm"
)

declare -g -A fsm9=(
        [model_name]="fsm9"
        [model_path]="${REAL_BUG_DIR}/fsm9.als"
        [correct_model_path]="${MODEL_DIR}/fsm.als"
        [scope]="3"
        [test_name]="fsm"
)

declare -g -A gradeFaulty=(
        [model_name]="gradeFaulty"
        [model_path]="${REAL_BUG_DIR}/gradeFaulty.als"
        [correct_model_path]="${MODEL_DIR}/grade.als"
        [scope]="3"
        [test_name]="grade"
)

declare -g -A otherFaulty=(
        [model_name]="otherFaulty"
        [model_path]="${REAL_BUG_DIR}/otherFaulty.als"
        [correct_model_path]="${MODEL_DIR}/other.als"
        [scope]="4"
        [test_name]="other"
)

declare -g -A student1=(
        [model_name]="student1"
        [model_path]="${REAL_BUG_DIR}/student1.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

declare -g -A student2=(
        [model_name]="student2"
        [model_path]="${REAL_BUG_DIR}/student2.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

declare -g -A student3=(
        [model_name]="student3"
        [model_path]="${REAL_BUG_DIR}/student3.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

declare -g -A student4=(
        [model_name]="student4"
        [model_path]="${REAL_BUG_DIR}/student4.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

declare -g -A student5=(
        [model_name]="student5"
        [model_path]="${REAL_BUG_DIR}/student5.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

declare -g -A student6=(
        [model_name]="student6"
        [model_path]="${REAL_BUG_DIR}/student6.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

declare -g -A student7=(
        [model_name]="student7"
        [model_path]="${REAL_BUG_DIR}/student7.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

declare -g -A student8=(
        [model_name]="student8"
        [model_path]="${REAL_BUG_DIR}/student8.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

declare -g -A student9=(
        [model_name]="student9"
        [model_path]="${REAL_BUG_DIR}/student9.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

declare -g -A student10=(
        [model_name]="student10"
        [model_path]="${REAL_BUG_DIR}/student10.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

declare -g -A student11=(
        [model_name]="student11"
        [model_path]="${REAL_BUG_DIR}/student11.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

declare -g -A student12=(
        [model_name]="student12"
        [model_path]="${REAL_BUG_DIR}/student12.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

declare -g -A student13=(
        [model_name]="student13"
        [model_path]="${REAL_BUG_DIR}/student13.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

declare -g -A student14=(
        [model_name]="student14"
        [model_path]="${REAL_BUG_DIR}/student14.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

declare -g -A student15=(
        [model_name]="student15"
        [model_path]="${REAL_BUG_DIR}/student15.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

declare -g -A student16=(
        [model_name]="student16"
        [model_path]="${REAL_BUG_DIR}/student16.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

declare -g -A student17=(
        [model_name]="student17"
        [model_path]="${REAL_BUG_DIR}/student17.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

declare -g -A student18=(
        [model_name]="student18"
        [model_path]="${REAL_BUG_DIR}/student18.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

declare -g -A student19=(
        [model_name]="student19"
        [model_path]="${REAL_BUG_DIR}/student19.als"
        [correct_model_path]="${MODEL_DIR}/student.als"
        [scope]="3"
        [test_name]="student"
)

REMOVE_FLAG=true
