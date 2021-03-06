_exercism() {
    local curcontext="$curcontext" state line
    typeset -A opt_args

    local -a options
    options=(debug:"Outputs useful debug information."
             configure:"Writes config values to a JSON file."
             submit:"Submits a new iteration to a problem on exercism.io."
             download:"Downloads and saves a specified submission into the local system"
             help:"Shows a list of commands or help for one command")

    _arguments -s -S \
        {-c,--config}"[path to config file]:file:_files"    \
        {-d,--debug}"[turn on verbose logging]" \
        {-h,--help}"[show help]"                \
        {-v,--version}"[print the version]"     \
        '(-): :->command'                       \
        '(-)*:: :->option-or-argument'          \
        && return 0;

    case $state in
        (command)
            _describe 'commands' options ;;
        (option-or-argument)
            case $words[1] in
                s*)
                    _files
                    ;;
            esac
    esac
}

compdef '_exercism' exercism
