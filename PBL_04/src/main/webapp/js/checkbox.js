
    function togglePermissionCheckboxes() {
        var allPermission = document.getElementById('allPermission');
        var salesRegister = document.getElementById('salesRegister');
        var accountsRegister = document.getElementById('accountsRegister');

        if (salesRegister.checked || accountsRegister.checked) {
            allPermission.checked = false;
        } else {
            allPermission.disabled = false;
        }
    }

    function toggleSpecificCheckboxes() {
        var allPermission = document.getElementById('allPermission');
        var salesRegister = document.getElementById('salesRegister');
        var accountsRegister = document.getElementById('accountsRegister');

        if (allPermission.checked) {
            salesRegister.checked = false;
            accountsRegister.checked = false;
        }
    }

    document.addEventListener('DOMContentLoaded', function() {
        var allPermission = document.getElementById('allPermission');
        var salesRegister = document.getElementById('salesRegister');
        var accountsRegister = document.getElementById('accountsRegister');

        // 初期状態の設定
        allPermission.checked = true;
        togglePermissionCheckboxes();
        toggleSpecificCheckboxes();

        // イベントリスナーの設定
        allPermission.addEventListener('change', function() {
            if (allPermission.checked) {
                salesRegister.checked = false;
                accountsRegister.checked = false;
            }
            togglePermissionCheckboxes();
        });

        salesRegister.addEventListener('change', function() {
            if (salesRegister.checked) {
                allPermission.checked = false;
            }
            togglePermissionCheckboxes();
        });

        accountsRegister.addEventListener('change', function() {
            if (accountsRegister.checked) {
                allPermission.checked = false;
            }
            togglePermissionCheckboxes();
        });
    });

