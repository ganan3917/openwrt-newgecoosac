// 表单提交时进行验证
document.addEventListener('DOMContentLoaded', function () {
    const form = document.querySelector('form.cbi');
    if (form) {
        form.addEventListener('submit', function (event) {
            const portInput = document.querySelector('input[name="cbid.newgecoosac.@newgecoosac[0].port"]');
            const portValue = parseInt(portInput.value);
            if (isNaN(portValue) || portValue < 1 || portValue > 65535) {
                alert('请输入有效的端口号（1 - 65535）');
                event.preventDefault();
            }
        });
    }
});