def test_list_items(client):
    resp = client.get("/items/")

    assert resp.status_code == 200
    assert resp.json() == [{"item_id": 1}, {"item_id": 2}]


def test_read_item(client):
    resp = client.get("/items/123/")

    assert resp.status_code == 200
    assert resp.json() == {"item_id": 123}
