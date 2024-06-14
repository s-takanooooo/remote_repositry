 function togglePermissionCheckboxes() {
            var allPermission = document.getElementById('allPermission');
            var salesRegister = document.getElementById('salesRegister');
            var accountsRegister = document.getElementById('accountsRegister');
            
            if (allPermission.checked) {
                salesRegister.checked = false;
                accountsRegister.checked = false;
            }
            
            salesRegister.disabled = allPermission.checked;
            accountsRegister.disabled = allPermission.checked;
        }

        document.addEventListener('DOMContentLoaded', function() {
            var allPermission = document.getElementById('allPermission');
            allPermission.addEventListener('change', togglePermissionCheckboxes);

            // 初期状態を設定
            togglePermissionCheckboxes();
        });