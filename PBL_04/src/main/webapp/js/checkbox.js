
    function toggleAuthorityCheckboxes() {
        var allAuthority = document.getElementById('allAuthority');
        var salesRegister = document.getElementById('salesRegister');
        var accountsRegister = document.getElementById('accountsRegister');

        if (salesRegister.checked || accountsRegister.checked) {
            allAuthority.checked = false;
        } else {
            allAuthority.disabled = false;
        }
    }

    function toggleSpecificCheckboxes() {
        var allAuthority = document.getElementById('allAuthority');
        var salesRegister = document.getElementById('salesRegister');
        var accountsRegister = document.getElementById('accountsRegister');

        if (allAuthority.checked) {
            salesRegister.checked = false;
            accountsRegister.checked = false;
        }
    }

    document.addEventListener('DOMContentLoaded', function() {
        var allAuthority = document.getElementById('allAuthority');
        var salesRegister = document.getElementById('salesRegister');
        var accountsRegister = document.getElementById('accountsRegister');

        // 初期状態の設定
        allAuthority.checked = true;
        toggleAuthorityCheckboxes();
        toggleSpecificCheckboxes();

        // イベントリスナーの設定
        allAuthority.addEventListener('change', function() {
            if (allAuthority.checked) {
                salesRegister.checked = false;
                accountsRegister.checked = false;
            }
            toggleAuthorityCheckboxes();
        });

        salesRegister.addEventListener('change', function() {
            if (salesRegister.checked) {
                allAuthority.checked = false;
            }
            toggleAuthorityCheckboxes();
        });

        accountsRegister.addEventListener('change', function() {
            if (accountsRegister.checked) {
                allAuthority.checked = false;
            }
            toggleAuthorityCheckboxes();
        });
    });

