module TestProgressesHelper
  def display_result(test_progress)
    if test_progress.test_passed?
      result_color = 'green'
      title = 'Test passed'
    else
      result_color = 'red'
      title = 'Test failed'
    end

    "<h2 style='color: #{result_color}'>#{title}</h2>
    <h2> You answer on <span style='color: #{result_color}'> #{test_progress.result}</span>
    % of questions</h2>".html_safe
  end
end
