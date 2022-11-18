import pytest

from rest_framework.test import APIClient

from translations.models import Translation, STATUS_IN_QUEUE, STATUS_IN_PROCESS, STATUS_TRANSLATED, STATUS_CHECKED, STATUS_CHECKING

pytestmark = pytest.mark.django_db(transaction=True)

def test_admin_list(api_client_admin, Translation):
    resp = api_client_admin.get('/translations/')
    assert resp.status_code == 200
    assert len(resp.json()) == 5

    resp = api_client_admin.get('/translations/?status={}'.format(STATUS_IN_QUEUE))
    assert resp.status_code == 200
    assert len(resp.json()) == 2

    resp = api_client_admin.get('/translations/?status={}'.format(STATUS_IN_PROCESS))
    assert resp.status_code == 200
    assert len(resp.json()) == 1

def test_translator_list(api_client_translator, Translation):
    resp = api_client_translator.get('/translations/')
    assert resp.status_code == 200
    assert len(resp.json()) == 5

    resp = api_client_translator.get('/translations/?status={}'.format(STATUS_IN_QUEUE))
    assert resp.status_code == 200
    assert len(resp.json()) == 2

    resp = api_client_translator.get('/translations/?status={}'.format(STATUS_IN_PROCESS))
    assert resp.status_code == 200
    assert len(resp.json()) == 1

def test_translator_update_status(api_client_translator, Translation):
    tr1 = Translation.objects.filter(status=STATUS_IN_QUEUE).first()

    resp = api_client_translator.patch(
        f'/translations/{tr1.id}/',
        {
            'from_status': STATUS_IN_QUEUE,
            'status': STATUS_IN_PROCESS
        }
    )
    assert resp.status_code == 200, resp.json()

    tr1.refresh_from_db()
    assert tr1.status == STATUS_IN_PROCESS

    resp = api_client_translator.patch(
        f'/translations/{tr1.id}/',
        {
            'from_status': STATUS_IN_QUEUE,
            'status': STATUS_IN_PROCESS
        }
    )
    assert resp.status_code == 400
    assert resp.json() == ['Status is outdated']

    resp = api_client_translator.patch(
        f'/translations/{tr1.id}/',
        {
            'from_status': STATUS_IN_PROCESS,
            'status': STATUS_CHECKED
        }
    )
    assert resp.status_code == 400
    assert resp.json() == ['Permission Denied for Status']

    tr1.refresh_from_db()
    assert tr1.status == STATUS_IN_PROCESS

def test_translator_update_translation(api_client_translator, Translation):
    tr1 = Translation.objects.filter(status=STATUS_IN_PROCESS).first()

    resp = api_client_translator.patch(
        f'/translations/{tr1.id}/',
        {
            'txt_translation': 'New translation'
        }
    )
    assert resp.status_code == 200, resp.json()

    tr1.refresh_from_db()
    assert tr1.txt_translation == 'New translation'

    resp = api_client_translator.patch(
        f'/translations/{tr1.id}/',
        {
            'txt_translation': 'Updated translation',
            'status': STATUS_TRANSLATED,
            'from_status': STATUS_IN_PROCESS
        }
    )
    assert resp.status_code == 200, resp.json()

    tr1.refresh_from_db()
    assert tr1.txt_translation == 'Updated translation'
    assert tr1.status == STATUS_TRANSLATED


def test_qa_update_translation(api_client_qa, Translation):
    tr1 = Translation.objects.filter(status=STATUS_IN_PROCESS).first()

    resp = api_client_qa.patch(
        f'/translations/{tr1.id}/',
        {
            'txt_translation': 'New translation'
        }
    )
    assert resp.status_code == 400
    assert resp.json() == ['Permission Denied for Translation']

def test_qa_update_comment(api_client_qa, Translation):
    tr1 = Translation.objects.filter(status=STATUS_CHECKING).first()

    resp = api_client_qa.patch(
        f'/translations/{tr1.id}/',
        {
            'qa_comment': 'OK'
        }
    )
    assert resp.status_code == 200, resp.json()

    tr1.refresh_from_db()
    assert tr1.qa_comment == 'OK'

    resp = api_client_qa.patch(
        f'/translations/{tr1.id}/',
        {
            'qa_comment': 'Good',
            'status': STATUS_CHECKED,
            'from_status': STATUS_CHECKING
        }
    )
    assert resp.status_code == 200, resp.json()

    tr1.refresh_from_db()
    assert tr1.qa_comment == 'Good'
    assert tr1.status == STATUS_CHECKED


def test_translator_update_comment(api_client_translator, Translation):
    tr1 = Translation.objects.filter(status=STATUS_CHECKING).first()

    resp = api_client_translator.patch(
        f'/translations/{tr1.id}/',
        {
            'qa_comment': 'OK'
        }
    )
    assert resp.status_code == 400
    assert resp.json() == ['Permission Denied for QA Comment']
