using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EaterController : MonoBehaviour
{
    public enum EATERSTATES
    {
        NONE,
        RESET
    }

    EATERSTATES state = EATERSTATES.NONE;

    public AudioSource killSound;

    float rotx = 0;
    float roty = 0;
    float rotz = 0;
    float behaviorTimer = 10f;
    float behaviorCounter = 0f;
    float hunger = 100f;
    
    playerController player;

    Vector3 baseRotations;
    // Start is called before the first frame update
    void Start()
    {
        rotx = transform.localEulerAngles.x;
        roty = transform.localEulerAngles.y;
        rotz = transform.localEulerAngles.z;
        baseRotations = new Vector3(rotx, roty, rotz);

        player = GameObject.Find("Player").GetComponent<playerController>();
    }

    public void Feed(float nutritionalValue)
    {
        state = EATERSTATES.RESET;
        hunger = Mathf.Min(hunger + nutritionalValue, 100f);
    }

    // Update is called once per frame
    void Update()
    {
        if (player.paused)
        {
            return;
        }

        switch (state)
        {
            case EATERSTATES.NONE:
                hunger -= 5f * Time.deltaTime; 

                Debug.Log(hunger);

                if (hunger <= 85f)
                {
                    roty += 0.5f * Time.deltaTime;
                    transform.localRotation = Quaternion.Euler(rotx, roty, rotz);
                }

                if (hunger <= 10)
                {
                    killSound.Play();
                    player.dead = true;
                }

                break;
            
            case EATERSTATES.RESET:
                Vector3 lerpedEulerAngles = Vector3.Lerp(transform.localEulerAngles, baseRotations, 0.5f);
                transform.localRotation = Quaternion.Euler(lerpedEulerAngles.x, lerpedEulerAngles.y, lerpedEulerAngles.z);
                roty = lerpedEulerAngles.y;
                if (Mathf.Abs(transform.localEulerAngles.y - baseRotations.y) <= 0.5f)
                {
                    Debug.Log("reset");
                    state = EATERSTATES.NONE;
                }

                break;
        }

    }
}
