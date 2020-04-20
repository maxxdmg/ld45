using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class playerController : MonoBehaviour
{
    public bool dead = false;
    float roty = 0f; float rotx = 0f;
    float mouseAcceleration = 0f;
    float rotationSpeed = 100f;
    Camera camera;
    GameObject OffHand;
    GameObject HeldItem;

    public bool paused = false;
    GameObject menu;
    GameObject feedTrigger;
    GameObject DeathScreen;
    GameObject WinScreen;
    bool win = false;
    float GameCounter = 0f;
    void Start()
    {
        camera = FindObjectOfType<Camera>();
        OffHand = GameObject.Find("OffHand");
        HeldItem = null;
        Cursor.lockState = CursorLockMode.Locked;
        menu = GameObject.Find("Menu");
        menu.SetActive(false);
        feedTrigger = GameObject.Find("FeedTrigger");
        feedTrigger.SetActive(false);
    
        DeathScreen = GameObject.Find("DEATHSCREEN");
        DeathScreen.SetActive(false);

        WinScreen = GameObject.Find("WINSCREEN");
        WinScreen.SetActive(false);

    }

    public void AcquireItem(GameObject newItem)
    {
        HeldItem = newItem;
    }

    public void FeedHandler()
    { 
        if (Physics.Raycast(transform.position, transform.forward, out RaycastHit playerCast, 5f))
        {
            
            if (playerCast.transform.tag == "FeedTrigger")
            {
                if (Input.GetKey(KeyCode.Space))
                {
                    HeldItem.gameObject.GetComponent<FoodItem>().feedToMonster();
                    HeldItem = null;
                    feedTrigger.SetActive(false);
                }
            }
        }
    }

    public void QuitBtn()
    {
        Application.Quit();
    }

    public void ChangePause()
    {
            paused = !paused;

            menu.SetActive(paused);
            if(!paused)
            {
                Cursor.lockState = CursorLockMode.Locked;
            }
            else
            {
                Cursor.lockState = CursorLockMode.None;
            }
    }

    public void restart()
    {
        SceneManager.LoadScene("Main");
    }

    void Update()
    {
        if (GameCounter >= 150)
        {
            win = true;
        }
        else
        {
            GameCounter += 1f * Time.deltaTime;
        }

        

        if (dead)
        {
            if (!paused)
            {
                ChangePause();
                DeathScreen.SetActive(true);
            }
            return;
        } else if (win)
        {
            if (!paused)
            {
                ChangePause();
                WinScreen.SetActive(true);
            }
            return;
        }

        if (Input.GetKeyDown(KeyCode.Escape))
        {
            ChangePause();
        }

        if (!paused)
        {
            roty += Input.GetAxis("Mouse X") * Time.deltaTime * rotationSpeed;
            rotx += Input.GetAxis("Mouse Y") * Time.deltaTime * (rotationSpeed / 2);
            transform.rotation = Quaternion.Euler(-rotx, roty, 0f);

            

            if (HeldItem != null)
            {
                feedTrigger.SetActive(true);

                HeldItem.transform.position = OffHand.transform.position;
                FeedHandler();
            }
        }

    }
}
