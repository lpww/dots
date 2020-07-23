function fish_prompt
    echo -n (basename $PWD)
    set_color normal
    echo -n ' % '
end
