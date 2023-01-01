let recordBestTime, modeBT;

function checkItemIfNull() {
  if (localStorage.getItem('record-best-time') == null) {
    localStorage.setItem(
      'record-best-time',
      JSON.stringify({
        easy: 'NONE',
        normal: 'NONE',
        hard: 'NONE',
      })
    );
  } else {
    recordBestTime = JSON.parse(localStorage.getItem('record-best-time'));
  }
}

checkItemIfNull();

function loadBestTime() {
  checkItemIfNull();

  switch (gameModeName) {
    case 'EASY':
      modeBT = recordBestTime['easy'];
      break;
    case 'NORMAL':
      modeBT = recordBestTime['normal'];
      break;
    case 'HARD':
      modeBT = recordBestTime['hard'];
      break;
    default:
      console.log('Unknown Game Mode');
  }
}

function saveToLocalStorage() {
  switch (gameModeName) {
    case 'EASY':
      recordBestTime = {
        easy: timeAsText,
        normal: recordBestTime['normal'],
        hard: recordBestTime['hard'],
      };
      break;
    case 'NORMAL':
      recordBestTime = {
        easy: recordBestTime['easy'],
        normal: timeAsText,
        hard: recordBestTime['hard'],
      };
      break;
    case 'HARD':
      recordBestTime = {
        easy: recordBestTime['easy'],
        normal: recordBestTime['normal'],
        hard: timeAsText,
      };
      break;
    default:
      console.log('Unknown Game Mode');
  }

  localStorage.setItem('record-best-time', JSON.stringify(recordBestTime));
}
