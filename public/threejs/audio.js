//-----------AUDIO AND SOUND-----------------//
const audioFiles = [
      "intro1.mp3",
      "intro2.mp3",
      "intro3.mp3",
      "intro4.mp3",
]; // Danh sách các tệp mp3 trong thư mục /audio/
const introAudio = document.getElementById("intro_audio");
const randomIndex = Math.floor(Math.random() * audioFiles.length); // Chọn một số ngẫu nhiên từ 0 đến số lượng tệp mp3 - 1
const randomAudio = audioFiles[randomIndex]; // Lấy tên tệp mp3 tương ứng với số ngẫu nhiên
const infoVideo = document.getElementById("introVideo");
const muteVolume = document.getElementById("volume");
muteVolume.addEventListener("click", () => {
      if (introAudio.muted) {
            introAudio.muted = false;
            muteVolume.innerHTML = '<i class="fa-solid fa-volume-off"></i>';
      } else {
            introAudio.muted = true;
            muteVolume.innerHTML = '<i class="fa-solid fa-volume-xmark"></i>';
      }
});
window.onload = function () {
      let isIntroAudioPlayed = false;
      introAudio.src = "/audio/" + randomAudio; // Đặt đường dẫn tới tệp mp3 ngẫu nhiên
      introAudio.volume = 0.1; // Thiết lập âm lượng
      window.addEventListener("click", function () {
            // Kiểm tra xem audio đã phát hay chưa
            if (!isIntroAudioPlayed && introAudio.paused) {
                  introAudio.play(); // Nếu chưa phát và hàm chưa vô hiệu hóa, thì phát audio
                  isIntroAudioPlayed = true; // Đánh dấu hàm đã được thực thi
            }
      });
};
//----------------------------------------------------//