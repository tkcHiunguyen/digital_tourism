//===============> MENU BAR <============================\\
const menuBar = document.querySelector(".menuBar");
const listBar = document.querySelector(".listBar");
menuBar.addEventListener("click", () => {
      listBar.classList.toggle("inactive");
});
const subFrame = document.querySelector(".subFrame");
const btnInfo = document.querySelector(".btnInfo");
const closeSubFrame = document.querySelector(".close-subFrame");
const modelFrame = document.querySelector(".modelFrame");
const embedWrapper = document.querySelector(".sketchfab-embed-wrapper");
btnInfo.addEventListener("click", () => {
      subFrame.style.display = "block";
      listBar.style.display = "none";
      modelFrame.style.display = "none";
});
closeSubFrame.addEventListener("click", () => {
      subFrame.style.display = "none";
      listBar.style.display = "block";
      if (embedWrapper.innerHTML != "") {
            modelFrame.style.display = "block";
      }
});
const btnVideo = document.querySelector(".btnVideo");
const videoFrame = document.querySelector(".videoFrame");
const closeVideoFrame = document.querySelector(".close-videoFrame");
const introAudio = document.getElementById("intro_audio");

btnVideo.addEventListener("click", () => {
      videoFrame.style.display = "block";
      listBar.style.display = "none";
      modelFrame.style.display = "none";
      introAudio.pause();
});
closeVideoFrame.addEventListener("click", () => {
      videoFrame.style.display = "none";
      listBar.style.display = "block";
      introAudio.play();
      if (embedWrapper.innerHTML != "") {
            modelFrame.style.display = "block";
      }
});
const btnMap = document.querySelector(".btnMap");
btnMap.addEventListener("click", () => {
      window.location.href = "/map";
});
document
      .querySelector("#footer")
      .addEventListener("click", function (event) {
            event.stopPropagation(); // Ngăn chặn sự lan truyền của sự kiện
            // Xử lý sự kiện click trong <footer> ở đây
      });
document
      .querySelector(".header")
      .addEventListener("click", function (event) {
            event.stopPropagation(); // Ngăn chặn sự lan truyền của sự kiện
            // Xử lý sự kiện click trong <header> ở đây
      });
//----------------------------------------------------------------------//