function load-of5() {
    source ~/OpenFOAM-5.x/etc/bashrc
}
function pathcleanup() {
    # Remove redundant path variables, preserving order
    # https://unix.stackexchange.com/a/149054
    # Can be used with PATH=$(pathcleanup)
    echo "$(perl -e 'print join(":",grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"
}
# vim: ft=sh
