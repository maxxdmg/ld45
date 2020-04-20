using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class resume : MonoBehaviour
{
    Button button;
    public Font innerTextFont;
    playerController player;
    // Start is called before the first frame update
    void Start()
    {
        button = GetComponent<Button>();
        button.GetComponentInChildren<Text>().text = "RESUME";
        button.GetComponentInChildren<Text>().font = innerTextFont;
        //button.GetComponentInChildren<Text>().characterSize = 0.05f;
        button.GetComponentInChildren<Text>().fontSize = 15;

        player = FindObjectOfType<playerController>();

    }

    void ResumeBtn()
    {
        player.ChangePause();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
