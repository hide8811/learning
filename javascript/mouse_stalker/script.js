const stalker = document.getElementById('stalker');

const mouseStalker = (event) => {
  stalker.style.transform = `translate(${event.clientX}px, ${event.clientY}px)`;
};

document.addEventListener('mousemove', mouseStalker);
