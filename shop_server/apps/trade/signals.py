from django.db.models.signals import post_delete, pre_save
from django.dispatch import receiver

from .models import ShoppingCart


@receiver(pre_save, sender=ShoppingCart)
def create_shopping_cart(sender, instance=None, created=False, **kwargs):
    goods = instance.goods
    carts = ShoppingCart.objects.filter(id=instance.id)

    if carts:
        old_num = carts[0].num
        if instance.num > old_num:
            goods.goods_num -= instance.num - old_num
        else:
            goods.goods_num += old_num - instance.num

        goods.save()
    else:
        goods.goods_num -= instance.num
        goods.save()


@receiver(post_delete, sender=ShoppingCart)
def delete_shopping_cart(sender, instance=None, created=False, **kwargs):
    goods = instance.goods
    goods.goods_num += instance.num
    goods.save()






