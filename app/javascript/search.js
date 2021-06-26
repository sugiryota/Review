window.addEventListener('load', function(){
const startBtn = document.querySelector('#start-btn');
const resultDiv = document.getElementById("result-div");
const startBtn2 = document.querySelector('#start-btn2');
const searchIcon = document.querySelector('.search-icon2');


SpeechRecognition = webkitSpeechRecognition || SpeechRecognition;
let recognition = new SpeechRecognition();

recognition.lang = 'ja-JP';
recognition.interimResults = true;
recognition.continuous = true;

let finalTranscript = ''; 

recognition.onresult = (event) => {
  const interimTranscript = event.results[0][0].transcript;
  
  resultDiv.value =  interimTranscript ;
}



startBtn2.addEventListener('click', function(){
  recognition.start();
  searchIcon.src="/images/maic2.png"
  
  setTimeout(function(){
    recognition.stop();
    document.getElementById("start-btn").click();
  }, 5500);
  
})


startBtn.addEventListener('click', function(){
  recognition.stop();
})
resultDiv.addEventListener('change', function(){
  document.getElementById("start-btn").click();
})


})
