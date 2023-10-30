document.addEventListener('DOMContentLoaded', function () {
            const quantityContainers = document.querySelectorAll('.cart_t_i_quantity');
        
            quantityContainers.forEach(function (container) {
                const decreaseButton = container.querySelector('.decrease');
                const increaseButton = container.querySelector('.increase');
                const quantityInput = container.querySelector('.quantity-input');
                const quantityId = container.getAttribute('data-quantity-id');
        
                decreaseButton.addEventListener('click', function () {
                    decreaseValue(quantityId);
                });
        
                increaseButton.addEventListener('click', function () {
                    increaseValue(quantityId);
                });
            });
        
            function increaseValue(quantityId) {
                const quantityInput = document.querySelector(`[data-quantity-id="${quantityId}"] .quantity-input`);
                let value = parseInt(quantityInput.value, 10);
                value = isNaN(value) ? 0 : value;
                value++;
                quantityInput.value = value;
            }
        
            function decreaseValue(quantityId) {
                const quantityInput = document.querySelector(`[data-quantity-id="${quantityId}"] .quantity-input`);
                let value = parseInt(quantityInput.value, 10);
                value = isNaN(value) ? 0 : value;
                value < 1 ? (value = 1) : '';
                value--;
                quantityInput.value = value;
            }
        });