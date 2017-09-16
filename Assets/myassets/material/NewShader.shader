// Shader created with Shader Forge v1.37 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.37;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:True,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33788,y:32508,varname:node_3138,prsc:2|emission-2798-OUT,alpha-6390-A;n:type:ShaderForge.SFN_Tex2d,id:6390,x:33053,y:32684,ptovrint:False,ptlb:tex_mask,ptin:_tex_mask,varname:node_6390,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d9b8df8d8c9d94743a1e5d4006c6aae8,ntxv:0,isnm:False;n:type:ShaderForge.SFN_If,id:2798,x:33574,y:32646,varname:node_2798,prsc:2|A-6390-B,B-5416-OUT,GT-7069-OUT,EQ-7380-RGB,LT-7380-RGB;n:type:ShaderForge.SFN_Slider,id:5416,x:32956,y:32552,ptovrint:False,ptlb:mask_threshold,ptin:_mask_threshold,varname:node_5416,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.8097325,max:1;n:type:ShaderForge.SFN_Tex2d,id:7380,x:33053,y:32886,ptovrint:False,ptlb:tex_line,ptin:_tex_line,varname:node_7380,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2dd3e19b0a18cd44798bef9cd1e95143,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5701,x:33142,y:33110,ptovrint:False,ptlb:tex_fill,ptin:_tex_fill,varname:node_5701,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8830d2c271fb7984ab3354b24453fd47,ntxv:2,isnm:False|UVIN-9959-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1508,x:32676,y:32996,varname:node_1508,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:7063,x:32687,y:33338,varname:node_7063,prsc:2,v1:1;n:type:ShaderForge.SFN_Slider,id:7578,x:32355,y:32974,ptovrint:False,ptlb:scale,ptin:_scale,cmnt:オブジェクトのサイズが大きくてもテクスチャ拡大してくないとき,varname:node_7578,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_UVTile,id:9959,x:32928,y:33110,varname:node_9959,prsc:2|UVIN-1508-UVOUT,WDT-8945-OUT,HGT-8945-OUT,TILE-7063-OUT;n:type:ShaderForge.SFN_Divide,id:8945,x:32687,y:33167,varname:node_8945,prsc:2|A-6021-OUT,B-7578-OUT;n:type:ShaderForge.SFN_Vector1,id:6021,x:32486,y:33211,varname:node_6021,prsc:2,v1:1;n:type:ShaderForge.SFN_Append,id:7069,x:33387,y:33110,varname:node_7069,prsc:2|A-5701-RGB,B-5701-A;proporder:5416-5701-6390-7380-7578;pass:END;sub:END;*/

Shader "Shader Forge/NewShader" {
    Properties {
        _mask_threshold ("mask_threshold", Range(0, 1)) = 0.8097325
        _tex_fill ("tex_fill", 2D) = "black" {}
        _tex_mask ("tex_mask", 2D) = "white" {}
        _tex_line ("tex_line", 2D) = "black" {}
        _scale ("scale", Range(0, 10)) = 1
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            ZWrite On
            
            AlphaToMask On
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _tex_mask; uniform float4 _tex_mask_ST;
            uniform float _mask_threshold;
            uniform sampler2D _tex_line; uniform float4 _tex_line_ST;
            uniform sampler2D _tex_fill; uniform float4 _tex_fill_ST;
            uniform float _scale;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
////// Lighting:
////// Emissive:
                float4 _tex_mask_var = tex2D(_tex_mask,TRANSFORM_TEX(i.uv0, _tex_mask));
                float node_2798_if_leA = step(_tex_mask_var.b,_mask_threshold);
                float node_2798_if_leB = step(_mask_threshold,_tex_mask_var.b);
                float4 _tex_line_var = tex2D(_tex_line,TRANSFORM_TEX(i.uv0, _tex_line));
                float node_8945 = (1.0/_scale);
                float node_7063 = 1.0;
                float2 node_9959_tc_rcp = float2(1.0,1.0)/float2( node_8945, node_8945 );
                float node_9959_ty = floor(node_7063 * node_9959_tc_rcp.x);
                float node_9959_tx = node_7063 - node_8945 * node_9959_ty;
                float2 node_9959 = (i.uv0 + float2(node_9959_tx, node_9959_ty)) * node_9959_tc_rcp;
                float4 _tex_fill_var = tex2D(_tex_fill,TRANSFORM_TEX(node_9959, _tex_fill));
                float3 emissive = lerp((node_2798_if_leA*_tex_line_var.rgb)+(node_2798_if_leB*float4(_tex_fill_var.rgb,_tex_fill_var.a)),_tex_line_var.rgb,node_2798_if_leA*node_2798_if_leB).rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,_tex_mask_var.a);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
