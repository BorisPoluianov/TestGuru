document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar');

  if (progressBar) {
    var questionNumber = progressBar.dataset.questionNumber;
    var questionsCount = progressBar.dataset.questionsCount;

    var resultInPercent = ((100 * (questionNumber - 1)) / questionsCount) + '%';
    progressBar.style.width = resultInPercent;
  };
});
