document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar');

  if (progressBar) {
    var questionPassed = progressBar.dataset.questionsPassed;
    var questionsCount = progressBar.dataset.questionsCount;

    var resultInPercent = ((100 * questionPassed) / questionsCount) + '%';
    progressBar.style.width = resultInPercent;
  };
});
