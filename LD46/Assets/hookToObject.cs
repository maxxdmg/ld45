using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class hookToObject : MonoBehaviour
{
    public GameObject hookedObject;
    public bool canHook = false;
    poleController poleCtrl;
    public bool floored = false;

    void Start()
    {
        hookedObject = null;
        poleCtrl = FindObjectOfType<poleController>();
    }

    void OnCollisionEnter(Collision other)
    {
        Debug.Log(other.gameObject);

        if (other.transform.tag == "Food" && hookedObject == null)
        {
            hookedObject = other.transform.gameObject;

            if (hookedObject.GetComponent<FoodItem>().personOwner != null)
            {
                hookedObject.GetComponent<FoodItem>().personOwner.GetComponent<personController>().HeldItem = null;
            }

            other.collider.enabled = false;
        }
        else if (other.transform.tag == "Street")
        {
            floored = true;
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (hookedObject != null)
        {
            hookedObject.transform.position = transform.position;
        }
    }
}
