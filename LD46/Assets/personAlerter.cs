using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class personAlerter : MonoBehaviour
{
    List<personController> persons;

    personController test;
    Camera cam;
    bool tested = false;
    public GameObject t;
    Vector3 a;
    GameObject text;

    List<GameObject> alerts;

    // Start is called before the first frame update
    void Start()
    {
        alerts = new List<GameObject>();
    }



    public void AddNewAlert(string text, GameObject person)
    {
        GameObject newText = Instantiate(t, a, Quaternion.identity);
        newText.transform.SetParent(person.transform);
        newText.GetComponent<Text>().text = text;
        newText.GetComponent<knownPerson>().person = person;

        alerts.Add(newText);
    }

    public void DeleteAlert(GameObject toDelete)
    {
        alerts.Remove(toDelete);
    }

    // Update is called once per frame
    void Update()
    {

        foreach (GameObject g in alerts)
        {
            a = Camera.main.WorldToScreenPoint(g.transform.position);
            g.transform.position = a;
        }
    }
}
