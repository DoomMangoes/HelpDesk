# Generated by Django 4.2.1 on 2023-05-24 22:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('helpdeskapp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('categoryName', models.CharField(max_length=64)),
            ],
        ),
        migrations.DeleteModel(
            name='User',
        ),
    ]
