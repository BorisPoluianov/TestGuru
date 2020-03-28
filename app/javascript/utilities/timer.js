document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer');

  if (timer) {
    var time = timer.dataset.remainingTime;
    setInterval(function () {
      if (time > 0) {
        time -= 1;
      } else {
        alert('Time is up!');
        document.querySelector('form').submit();
      }
      timerResult = parseInt(time / 60) + ':' + time % 60;
      timer.innerHTML = timerResult;
    }, 1000)
  };
});
