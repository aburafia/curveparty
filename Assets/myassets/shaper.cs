using System.Collections;
using System.Collections.Generic;
using UnityEngine;


//[ExecuteInEditMode()]
public class shaper : MonoBehaviour {

    public Texture2D fill;
    public Texture2D line;
    public Texture2D mask;
    public float scalevalue;

	// Use this for initialization
	void OnGUI() {
        //init();
    }

    void Start()
    {
        //init();
    }

    public void init()
    {
        GetComponent<Renderer>().material.SetTexture("_tex_fill", fill);
        GetComponent<Renderer>().material.SetTexture("_tex_line", line);
        GetComponent<Renderer>().material.SetTexture("_tex_mask", mask);
        //GetComponent<Renderer>().material.SetFloat("_scale",scalevalue);
    }

    // Update is called once per frame
    void Update () {
		
	}
}
