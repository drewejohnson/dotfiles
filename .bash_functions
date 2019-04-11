function load-of5() {
    source ~/OpenFOAM-5.x/etc/bashrc
}

function hicow() {
    fortune -a | cow$(shuf -n 1 -e say think) -f $(ls /usr/share/cows/ | shuf -n 1) \
        -$(shuf -n 1 -e b d g p s t w y) 2>/dev/null || fortune -a | cowsay
}
# vim: ft=sh
