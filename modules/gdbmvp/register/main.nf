
process GDBMVP_REGISTER {
    tag "$meta.id"
    label 'process_low'

    //conda (params.enable_conda ? "bioconda::somalier=0.2.15" : null)
    //container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
    //    'https://depot.galaxyproject.org/singularity/somalier:0.2.15--h37c5b7d_0':
    //    'quay.io/biocontainers/somalier:0.2.15--h37c5b7d_0' }"

    input:
    tuple val(meta), path(gpr), path(json)
    val(validateOK)

    output:
    stdout                       emit: registerOK

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    def prefix = task.ext.prefix ?: "${meta.id}"

    """
    echo "Registration done successfully :)" \\
    ${args}

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        somalier: \$(echo \$(somalier 2>&1) | sed 's/^.*somalier version: //; s/Commands:.*\$//')
    END_VERSIONS
    """
}
