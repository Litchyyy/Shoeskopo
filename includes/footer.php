</main>
<footer class="site-footer">
  <div><strong>shoeskopo</strong><p>Find your next everyday pair.</p></div>
  <div class="footer-links"><a href="category.php?audience=men">Mens</a><a href="category.php?audience=women">Womens</a><a href="category.php?audience=kids">Kids</a></div>
  <small>© <?= date('Y') ?> shoeskopo</small>
</footer>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
document.addEventListener('DOMContentLoaded', function () {
  <?php if (!empty($_SESSION['swal_flash'])): ?>
  Swal.fire({icon: 'success', title: 'Success', text: <?= json_encode($_SESSION['swal_flash']) ?>, confirmButtonColor: '#315da9'});
  <?php unset($_SESSION['swal_flash']); endif; ?>
  document.querySelectorAll('.form-success').forEach(function (el) {
    const message = el.textContent.trim();
    if (message) Swal.fire({icon: 'success', title: 'Success', text: message, confirmButtonColor: '#315da9'});
  });
  document.querySelectorAll('.form-error').forEach(function (el) {
    const message = el.textContent.trim();
    if (message) Swal.fire({icon: 'error', title: 'Unable to complete action', text: message, confirmButtonColor: '#315da9'});
  });
  document.querySelectorAll('form[data-confirm]').forEach(function (form) {
    form.addEventListener('submit', function (event) {
      if (form.dataset.confirmed === 'yes') return;
      event.preventDefault();
      Swal.fire({title: 'Are you sure?', text: form.dataset.confirm, icon: 'warning', showCancelButton: true, confirmButtonText: 'Yes, continue', cancelButtonText: 'Cancel', confirmButtonColor: '#d33'}).then(function (result) {
        if (result.isConfirmed) { form.dataset.confirmed = 'yes'; form.requestSubmit(); }
      });
    });
  });
  const params = new URLSearchParams(window.location.search);
  if (params.get('updated') === '1' && !document.querySelector('.form-success')) {
    Swal.fire({icon: 'success', title: 'Updated', text: 'Your changes have been saved.', confirmButtonColor: '#315da9'});
  }
});
</script>
</body>
</html>
