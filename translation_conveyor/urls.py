from django.contrib import admin
from django.urls import path, include

from translations.views import TranslationViewSet, IndexView, AddMark
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'translations', TranslationViewSet, basename="translations")

urlpatterns = [
    path('', IndexView.as_view(), name='home'),
    path('admin/', admin.site.urls),
    path('__debug__/', include('debug_toolbar.urls')),
    path('', include(router.urls)),
    path('addmark/<int:pk>/', AddMark.as_view(), name='mark'),
]
