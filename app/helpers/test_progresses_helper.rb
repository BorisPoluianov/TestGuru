module TestProgressesHelper

  def colored_result(test_progress)
    if test_progress.test_passed?
      result_color = 'green'
    else
      result_color = 'red'
    end

    "<span style='color: #{result_color}'>#{test_progress.result}</span>".html_safe
  end
end
