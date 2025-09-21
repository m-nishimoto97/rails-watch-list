const modalOverlay = document.getElementById("modal-overlay");
const openBtn = document.getElementById("chat-open-button");
const closeBtn = document.getElementById("chat-close-button");

openBtn.addEventListener('click', () => {
  modalOverlay.classList.add('visible')
})

closeBtn.addEventListener('click', () => {
  modalOverlay.classList.remove('visible')
})
