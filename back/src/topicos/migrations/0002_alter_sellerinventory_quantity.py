# Generated by Django 4.1 on 2022-10-05 01:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('topicos', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sellerinventory',
            name='quantity',
            field=models.IntegerField(verbose_name='Quantity'),
        ),
    ]
