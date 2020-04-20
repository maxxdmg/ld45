using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Quit : MonoBehaviour
{
    Button button;
    public Font innerTextFont;
    playerController player;
    // Start is called before the first frame update
    void Start()
    {
        button = GetComponent<Button>();
        button.GetComponentInChildren<Text>().text = "QUIT";
        button.GetComponentInChildren<Text>().font = innerTextFont;
        //button.GetComponentInChildren<Text>().characterSize = 0.05f;
        button.GetComponentInChildren<Text>().fontSize = 15;

        player = FindObjectOfType<playerController>();

    }

    void QuitBtn()
    {
        Application.Quit();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
