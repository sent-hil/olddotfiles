function fish_prompt --description 'Write out the prompt'
  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    # set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  if not set -q __git_cb
    set __git_cb ":"(set_color brown)(git branch ^/dev/null | grep \* | sed 's/* //')(set_color normal)""
  end

  switch $USER
    case root

    if not set -q __fish_prompt_cwd
      if set -q fish_color_cwd_root
          set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
      else
          set -g __fish_prompt_cwd (set_color $fish_color_cwd)
      end
    end

    printf '%s:%s%s%s%s# ' $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb

    case '*'

    if not set -q __fish_prompt_cwd
      set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

    printf '%s:%s%s%s%s$ ' $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb
  end
end

if status --is-login
  set PATH /Users/senthil/o-ri/ /Users/senthil/.rbenv/versions/2.1.5/bin/ /usr/local/go/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/local/sbin /usr/local/Cellar/go/1.3/libexec/bin /Users/senthil/.dotify/.gobin /Users/senthil/Documents/work/koding/go/bin

  set GOPATH /Users/senthil/Documents/work/koding/go
  set GOROOT /usr/local/go
  set JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.7.0_25.jdk/Contents/Home
  #set GOBIN  /usr/local/go/bin
end

set -xU PYTHONSTARTUP ~/.pythonrc

function webconnect
  /usr/local/bin/csshX --sorthosts --tile_y 1 "webserver-$argv[1]a.sj.koding.com" "webserver-$argv[1]b.sj.koding.com" "webserver-$argv[1]c.sj.koding.com"
end

function socialconnect
  /usr/local/bin/csshX --sorthosts --tile_y 1 "socialserver-$argv[1]a.sj.koding.com" "socialserver-$argv[1]b.sj.koding.com"
end

function brokerconnect
  /usr/local/bin/csshX --sorthosts --tile_y 1 "broker-$argv[1]a.sj.koding.com" "broker-$argv[1]b.sj.koding.com"
end

set -x DOCKER_CERT_PATH /Users/senthil/.boot2docker/certs/boot2docker-vm
set -x DOCKER_TLS_VERIFY 1
