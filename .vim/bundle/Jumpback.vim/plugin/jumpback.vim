if exists("g:loaded_go_vroom")
  finish
endif

if &compatible
  echohl ErrorMsg
  echohl none
  finish
endif

" Check for Ruby functionality.
if !has("ruby")
    echohl ErrorMsg
    echon "Sorry, Go Vroom requires ruby support."
  finish
endif

let g:loaded_go_vroom = "true"

ruby << EOF
def clean_state
  @current_line = nil
end

# If line under cursor is a test, i.e function or method with name "Test.*",
# we run it. If not, we go up till we reach a test and run that or reach the
# top of the file and return."
def run_go_test_under_line
  @current_line ||= VIM::evaluate("line('.')")
  test_name       = VIM::evaluate("matchstr(getline('#{@current_line}'), 'Test.[a-zA-Z]*')")

  # the above regexp isn't good enough to catch edge cases like "createStart"
  sanity_check    = VIM::evaluate("matchstr(getline('#{@current_line}'), '\\Test.[a-zA-z]*\\wi')")

  if sanity_check != ""
    clean_state
    VIM::command("!go test -gocheck.f #{@test_name}")
  else
    if @current_line == 1
      clean_state
      VIM::command("echo 'No nearby test found.'")
    else
      @current_line = @current_line - 1
      run_go_test_under_line
    end
  end
end

EOF

"function RunGoTestUnderLine()
  ":ruby run_go_test_under_line
"endfunction
