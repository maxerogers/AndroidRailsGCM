package sbu.mad.android2rails2;

import org.apache.http.Header;

import android.content.Context;
import android.util.Log;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.AsyncHttpResponseHandler;
import com.loopj.android.http.RequestParams;

public class ShareExternalServer {
	private static String result ="";
	public String shareRegIdWithAppServer(final Context context, final String regId){
		Log.i("ServerMaster", "Attempting AsyncHttpClient");
		AsyncHttpClient client = new AsyncHttpClient();
		RequestParams params = new RequestParams();
		params.put("regId", regId);
		client.get("http://192.168.1.220:3000/api/v1/devices/test", params, new AsyncHttpResponseHandler(){
			public void onSuccess(String response) {
                Log.i("ServerMaster", "Sign In: "+response);
                ShareExternalServer.result = response;
            }
			@Override
		     public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error)
			{
		         // Response failed :(
				Log.i("ServerMaster", "Sign in Failed");
		     }
		});
		return ShareExternalServer.result ;
	}
}
