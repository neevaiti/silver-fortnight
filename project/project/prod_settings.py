from .settings import *


DEBUG = False

prod_allowed_host = os.getenv('PROD_ALLOWED_HOST')
ALLOWED_HOSTS = [prod_allowed_host, '0.0.0.0'] if prod_allowed_host else []


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.getenv('POSTGRES_DB'),
        'USER': os.getenv('POSTGRES_USER'),
        'PASSWORD': os.getenv('POSTGRES_PASSWORD'),
        'HOST': os.getenv('POSTGRES_HOST'),
        'PORT': os.getenv('POSTGRES_PORT'),
    }
}