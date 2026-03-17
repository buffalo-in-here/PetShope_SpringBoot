<!-- jQuery, Bootstrap 4 bundle (includes Popper for tooltips) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Charts: D3 v5 (C3 requires D3 v5 - d3.set removed in v6+), C3, Chartist -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/c3@0.7.20/c3.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartist@0.11.4/dist/chartist.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartist-plugin-tooltip@0.0.17/dist/chartist-plugin-tooltip.min.js"></script>
<!-- jVectorMap (CDN) -->
<script src="https://cdn.jsdelivr.net/npm/jvectormap@2.0.5/jquery-jvectormap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jvectormap@2.0.5/jquery-jvectormap-world-mill-en.js"></script>
<!-- Feather Icons -->
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.29.0/dist/feather.min.js"></script>
<!-- Perfect Scrollbar: core then jQuery plugin (CDN) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/perfect-scrollbar/1.5.5/perfect-scrollbar.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-perfect-scrollbar/1.5.5/perfect-scrollbar.jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-sparklines/3.0.1/jquery.sparkline.min.js"></script>
<!-- Simple Pagination -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/simplePagination.min.js"></script>
<!-- Theme scripts (local) -->
<script src="${classpath}/backend/dist/js/app-style-switcher.js"></script>
<script src="${classpath}/backend/dist/js/sidebarmenu.js"></script>
<!-- Dashboard - Initialize AFTER all dependencies loaded -->
<script>
(function() {
    if (typeof d3 === 'undefined' || typeof c3 === 'undefined' || typeof Chartist === 'undefined') {
        console.warn('Chart libraries not fully loaded, retrying in 500ms...');
        setTimeout(function() {
            var script = document.createElement('script');
            script.src = '${classpath}/backend/dist/js/pages/dashboards/dashboard1.min.js';
            document.body.appendChild(script);
        }, 500);
    } else {
        var script = document.createElement('script');
        script.src = '${classpath}/backend/dist/js/pages/dashboards/dashboard1.min.js';
        document.body.appendChild(script);
    }
})();
</script>
<!-- Custom JS - Load after dashboard -->
<script src="${classpath}/backend/dist/js/custom.min.js"></script>
