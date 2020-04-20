using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GetItems : MonoBehaviour
{
    poleController p;
    Text t;
    // Start is called before the first frame update
    void Start()
    {
        p = FindObjectOfType<poleController>();
        t = GetComponent<Text>();
    }

    // Update is called once per frame
    void Update()
    {
        t.text = "items caught: #" + p.items.ToString();
    }
}
