using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class StartBtn : MonoBehaviour
{
    Button button;
    public Font innerTextFont;
    // Start is called before the first frame update
    void Start()
    {
        button = GetComponent<Button>();
        button.GetComponentInChildren<Text>().text = "START";
        button.GetComponentInChildren<Text>().font = innerTextFont;
        //button.GetComponentInChildren<Text>().characterSize = 0.05f;
        button.GetComponentInChildren<Text>().fontSize = 15;

    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
