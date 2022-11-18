import pytest

from rest_framework.test import APIClient

@pytest.fixture()
def User(django_user_model):
    return django_user_model


@pytest.fixture()
def admin_user(User):
    return User.objects.create_user(
        email='admin@occipital.com',
        username='admin',
        is_staff=True,
        is_superuser=True,
        password='password'
    )

def set_trans_permissions(user, permissions):
    from django.contrib.auth.models import Permission
    from django.contrib.contenttypes.models import ContentType
    from translations.models import Translation

    content_type = ContentType.objects.get_for_model(Translation)
    for perm in permissions:
        user.user_permissions.add(Permission.objects.get(
            codename=perm,
            content_type=content_type,
        ))

@pytest.fixture()
def translator_user(User):
    from translations.models import STATUS_IN_QUEUE, STATUS_IN_PROCESS, STATUS_TRANSLATED
    user = User.objects.create_user(
        email='translator@occipital.com',
        username='translator',
        is_staff=True,
        password='password'
    )
    set_trans_permissions(user, [
        'view_translation',
        'can_change_translation',
        f'can_move_from_{STATUS_IN_QUEUE}_to_{STATUS_IN_PROCESS}',
        f'can_move_from_{STATUS_IN_PROCESS}_to_{STATUS_IN_QUEUE}',
        f'can_move_from_{STATUS_IN_PROCESS}_to_{STATUS_TRANSLATED}',
        f'can_move_from_{STATUS_TRANSLATED}_to_{STATUS_IN_PROCESS}',
        f'can_move_from_{STATUS_TRANSLATED}_to_{STATUS_IN_QUEUE}',
    ])
    return user

@pytest.fixture()
def qa_user(User):
    from translations.models import STATUS_IN_QUEUE, STATUS_TRANSLATED, STATUS_CHECKING, STATUS_CHECKED
    user = User.objects.create_user(
        email='qa@occipital.com',
        username='qa',
        is_staff=True,
        password='password'
    )
    set_trans_permissions(user, [
        'view_translation',
        'can_change_qa_comment',
        f'can_move_from_{STATUS_TRANSLATED}_to_{STATUS_CHECKING}',
        f'can_move_from_{STATUS_CHECKING}_to_{STATUS_TRANSLATED}',
        f'can_move_from_{STATUS_CHECKING}_to_{STATUS_CHECKED}',
        f'can_move_from_{STATUS_CHECKED}_to_{STATUS_CHECKING}',
        f'can_move_from_{STATUS_CHECKING}_to_{STATUS_IN_QUEUE}',
    ])
    return user


@pytest.fixture()
def api_client_admin(admin_user):
    client = APIClient()
    client.force_authenticate(user=admin_user)
    return client


@pytest.fixture()
def api_client_translator(translator_user):
    client = APIClient()
    client.force_authenticate(user=translator_user)
    return client


@pytest.fixture()
def api_client_qa(qa_user):
    client = APIClient()
    client.force_authenticate(user=qa_user)
    return client


@pytest.fixture()
def Translation():
    from translations.models import Translation, STATUS_IN_QUEUE, STATUS_IN_PROCESS, STATUS_CHECKING, STATUS_TRANSLATED

    Translation.objects.create(
        txt_original='Original',
        status=STATUS_IN_QUEUE
    )
    Translation.objects.create(
        txt_original='Original11',
        status=STATUS_IN_QUEUE
    )
    Translation.objects.create(
        txt_original='Original 2',
        status=STATUS_IN_PROCESS
    )
    Translation.objects.create(
        txt_original='Ttt',
        txt_translation='Ddd',
        status=STATUS_TRANSLATED
    )
    Translation.objects.create(
        txt_original='Ffff',
        txt_translation='GGGgg',
        status=STATUS_CHECKING
    )
    return Translation