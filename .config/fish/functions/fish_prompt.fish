function fish_prompt
    set_color -o
    echo -n (basename $PWD)
    echo -n ' % '
end
