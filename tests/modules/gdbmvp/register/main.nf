#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { GDBMVP_REGISTER } from '../../../../modules/gdbmvp/register/main.nf'

gpr       = file("https://github.com/nf-core/test-datasets/raw/modules/data/delete_me/somalier/family.ped", checkIfExists: true)

json      = file("https://github.com/nf-core/test-datasets/raw/modules/data/delete_me/somalier/groups.txt", checkIfExists: true)

greenlight = "all is good"

workflow test_gdbmvp_register {

    input = [
        [ id:'sample1' ], // meta map
        gpr,
        json
    ]

    GDBMVP_REGISTER ( input, greenlight )
}
