"""
Django settings for ecommerce project.

Generated by 'django-admin startproject' using Django 3.0.3.

For more information on this file, see
https://docs.djangoproject.com/en/3.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.0/ref/settings/

"""

import dj_database_url
import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = os.environ.get('secret_key', '_=4dm6vs^&ho6p29lhhkc3vh=(zl5-one3==g70o=z9b%&ddrt')

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = os.environ.get('debug', True)

ALLOWED_HOSTS = ['huyamazingshop.herokuapp.com']


# Application definition

INSTALLED_APPS = [
    'super_inlines',
    'nested_admin',
    'jazzmin',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.humanize',
    'ckeditor',
    'ckeditor_uploader',
    'crispy_forms',
    'easy_thumbnails',
    'django_filters',
    'accounts',
    'cart',
    'orders',
    'home',
    'course',
    'blog',
    'vnpay',
    
]

#cấu hình chỉ định trang đăng nhập và đăng kí
LOGIN_URL = 'login'
LOGOUT_URL = 'logout'
LOGIN_REDIRECT_URL = 'home:index'
LOGOUT_REDIRECT_URL = 'login'
#cấu hình mặc định
DEFAULT_AUTO_FIELD='django.db.models.AutoField'
USE_THOUSAND_SEPARATOR = True

#Cấu hình gửi email
EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_HOST_USER = 'sangbg2k1@gmail.com'
EMAIL_HOST_PASSWORD = 'tiqsnsnezwtvldhc'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
DEFAULT_FROM_EMAIL = 'Hi welcome to Django Website <noreply>'
#cấu hình phiên bản bootrap của crispy form
CRISPY_TEMPLATE_PACK = 'bootstrap4'

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

INTERNAL_IPS = [
    "127.0.0.1",
]

ROOT_URLCONF = 'ecommerce.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'cart.cart.cart_preprocessor'
            ],
        },
    },
]

WSGI_APPLICATION = 'ecommerce.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.0/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'webapp',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': '127.0.0.1',
        'PORT': '3306',
    },
    'OPTIONS': {'charset': 'utf8mb4'},
}



# Password validation
# https://docs.djangoproject.com/en/3.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/3.0/topics/i18n/

LANGUAGE_CODE = 'vi-vn'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = False


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.0/howto/static-files/

MEDIA_URL = '/media/'
CKEDITOR_UPLOAD_PATH = 'ck_uploads/'
STATIC_URL = '/static'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media/')
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, 'static')
]

VNPAY_RETURN_URL = 'http://localhost:8000/thanh-toan/payment-details'  # get from config
VNPAY_PAYMENT_URL = 'https://sandbox.vnpayment.vn/paymentv2/vpcpay.html'  # get from config
VNPAY_API_URL = 'https://sandbox.vnpayment.vn/merchant_webapi/merchant.html'
VNPAY_TMN_CODE = 'VDQV3CN6'  # Website ID in VNPAY System, get from config
VNPAY_HASH_SECRET_KEY = 'EAHKLIOQKHBVHTTHVRCWIDOCTHJOEEEB'  # Secret key for create checksum,get from config

import django_heroku
django_heroku.settings(locals())