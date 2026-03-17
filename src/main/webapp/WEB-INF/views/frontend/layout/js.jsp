<!-- jQuery (CDN) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Bootstrap 5 (CDN) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- ScrollReveal (CDN) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/scrollreveal.js/4.0.9/scrollreveal.min.js"></script>
<!-- Slider -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<script src="${classpath}/frontend/js/app.js"></script>
<script src="${classpath}/frontend/js/mobileMenu.js"></script>

<script>
    document.getElementById("thucung").addEventListener("click", function() {
        var dropdown = document.getElementById("thucungDropdown");
        dropdown.classList.toggle("hidden");
    });
</script>