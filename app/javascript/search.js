window.addEventListener('load', function(){
const startBtn = document.querySelector('#start-btn');
const resultDiv = document.getElementById("result-div");
const imgBtn = document.getElementById("img-btn");
const startBtn2 = document.querySelector('#start-btn2');


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

startBtn.addEventListener('mouseover', function(){
  recognition.start();
  imgBtn.src="/assets/maic.png"

  
})

startBtn2.addEventListener('click', function(){
  recognition.start();
  setTimeout(function(){
    document.getElementById("start-btn").click();
  }, 7*1000);
  
})

startBtn.addEventListener('mousedown', function(){
  recognition.start();
  
  
  imgBtn.src="/assets/maic.png"
  
})

startBtn.addEventListener('mouseout', function(){
  recognition.stop();
  imgBtn.src="/assets/search.png"
})

startBtn.addEventListener('click', function(){
  recognition.stop();
  imgBtn.src="/assets/search.png"
})


})
