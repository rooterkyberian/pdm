# BASH completion script for pdm
# Generated by pycomplete 0.3.1

_pdm_74498d98b6b27a5a_complete()
{
    local cur script coms opts com
    COMPREPLY=()
    _get_comp_words_by_ref -n : cur words

    # for an alias, get the real script behind it
    if [[ $(type -t ${words[0]}) == "alias" ]]; then
        script=$(alias ${words[0]} | sed -E "s/alias ${words[0]}='(.*)'/\\1/")
    else
        script=${words[0]}
    fi

    # lookup for command
    for word in ${words[@]:1}; do
        if [[ $word != -* ]]; then
            com=$word
            break
        fi
    done

    # completing for an option
    if [[ ${cur} == --* ]] ; then
        opts="--help --ignore-python --pep582 --verbose --version"

        case "$com" in

            (add)
            opts="--dev --editable --global --help --no-sync --project --save-compatible --save-exact --save-wildcard --section --update-eager --update-reuse --verbose"
        ;;

        (build)
        opts="--dest --help --no-clean --no-sdist --no-wheel --project --verbose"
    ;;

    (cache)
    opts="--help --verbose"
;;

(completion)
opts="--help"
;;

(config)
opts="--delete --global --help --local --project --verbose"
;;

(export)
opts="--dev --format --global --help --no-default --output --project --pyproject --section --verbose --without-hashes"
;;

(import)
opts="--dev --format --global --help --project --section --verbose"
;;

(info)
opts="--env --global --help --project --python --verbose --where"
;;

(init)
opts="--global --help --project --verbose --non-interactive"
;;

(install)
opts="--dev --global --help --no-default --no-lock --project --section --verbose"
;;

(list)
opts="--global --graph --help --project --reverse --verbose"
;;

(lock)
opts="--global --help --project --verbose"
;;

(remove)
opts="--dev --global --help --no-sync --project --section --verbose"
;;

(run)
opts="--global --help --list --project --verbose"
;;

(search)
opts="--global --help --project --verbose"
;;

(show)
opts="--global --help --project --verbose"
;;

(sync)
opts="--clean --dev --dry-run --global --help --no-clean --no-default --project --section --verbose"
;;

(update)
opts="--dev --global --help --no-default --dry-run --outdated --project --save-compatible --save-exact --save-wildcard --section --top --unconstrained --update-eager --update-reuse --verbose"
;;

(use)
opts="--first --global --help --project --verbose"
;;

esac

        COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
        __ltrim_colon_completions "$cur"

        return 0;
    fi

    # completing for a command
    if [[ $cur == $com ]]; then
        coms="add build cache completion config export import info init install list lock remove run search show sync update use"

        COMPREPLY=($(compgen -W "${coms}" -- ${cur}))
        __ltrim_colon_completions "$cur"

        return 0
    fi
}

complete -o default -F _pdm_74498d98b6b27a5a_complete pdm
