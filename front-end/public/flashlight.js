document.addEventListener("mousemove", function(event) {
    const overlay = document.getElementById("flashlight-overlay");
    overlay.style.background = `radial-gradient(circle 100px at ${event.clientX}px ${event.clientY}px, transparent 100px, rgba(0, 0, 0, 0.9) 120px)`;
});
