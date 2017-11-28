package com.tasty.vo;

import java.io.Serializable;

public class Authority implements Serializable{

		private String email;
		private String authority;
		
		public Authority() {
			
		}

		public Authority(String email, String authority) {
			this.email = email;
			this.authority = authority;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getAuthority() {
			return authority;
		}

		public void setAuthority(String authority) {
			this.authority = authority;
		}

		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((authority == null) ? 0 : authority.hashCode());
			result = prime * result + ((email == null) ? 0 : email.hashCode());
			return result;
		}

		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			Authority other = (Authority) obj;
			if (authority == null) {
				if (other.authority != null)
					return false;
			} else if (!authority.equals(other.authority))
				return false;
			if (email == null) {
				if (other.email != null)
					return false;
			} else if (!email.equals(other.email))
				return false;
			return true;
		}

		@Override
		public String toString() {
			return "Authority [email=" + email + ", authority=" + authority + "]";
		}
		
		
}
