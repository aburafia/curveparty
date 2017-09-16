using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class camerarotate : MonoBehaviour {

    public GameObject cam;

	// Use this for initialization
	void Start () {
		
	}

    // Update is called once per frame
    float i;
	void Update () {
        transform.rotation *= Quaternion.Euler(1f, 1f, 0f);

        i += 0.01f;
        cam.transform.localPosition = new Vector3(0f, 0f, (Mathf.Sin(i) * 7) - 5f);
        
	}
}
