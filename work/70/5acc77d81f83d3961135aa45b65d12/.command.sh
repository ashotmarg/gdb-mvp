#!/bin/bash -ue
echo "Registration done successfully :)" \


cat <<-END_VERSIONS > versions.yml
"test_gdbmvp_register:GDBMVP_REGISTER":
    somalier: $(echo $(somalier 2>&1) | sed 's/^.*somalier version: //; s/Commands:.*$//')
END_VERSIONS
